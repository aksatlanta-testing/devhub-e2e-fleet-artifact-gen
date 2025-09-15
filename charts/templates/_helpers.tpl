
{{- define "go-echo0cfaf4db-a535-4c61-bb52-b091be863c4f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0cfaf4db-a535-4c61-bb52-b091be863c4f.fullname" -}}
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


{{- define "go-echo0cfaf4db-a535-4c61-bb52-b091be863c4f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0cfaf4db-a535-4c61-bb52-b091be863c4f.labels" -}}
helm.sh/chart: {{ include "go-echo0cfaf4db-a535-4c61-bb52-b091be863c4f.chart" . }}
{{ include "go-echo0cfaf4db-a535-4c61-bb52-b091be863c4f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0cfaf4db-a535-4c61-bb52-b091be863c4f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0cfaf4db-a535-4c61-bb52-b091be863c4f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}