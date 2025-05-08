
{{- define "go-echo3a7c7b87-cfc3-42f9-b023-4b941f399e8c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a7c7b87-cfc3-42f9-b023-4b941f399e8c.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo3a7c7b87-cfc3-42f9-b023-4b941f399e8c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a7c7b87-cfc3-42f9-b023-4b941f399e8c.labels" -}}
helm.sh/chart: {{ include "go-echo3a7c7b87-cfc3-42f9-b023-4b941f399e8c.chart" . }}
{{ include "go-echo3a7c7b87-cfc3-42f9-b023-4b941f399e8c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3a7c7b87-cfc3-42f9-b023-4b941f399e8c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3a7c7b87-cfc3-42f9-b023-4b941f399e8c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}