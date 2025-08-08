
{{- define "go-echo49b72b0e-2cb4-43cd-b825-71f8f326ceec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49b72b0e-2cb4-43cd-b825-71f8f326ceec.fullname" -}}
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


{{- define "go-echo49b72b0e-2cb4-43cd-b825-71f8f326ceec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49b72b0e-2cb4-43cd-b825-71f8f326ceec.labels" -}}
helm.sh/chart: {{ include "go-echo49b72b0e-2cb4-43cd-b825-71f8f326ceec.chart" . }}
{{ include "go-echo49b72b0e-2cb4-43cd-b825-71f8f326ceec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo49b72b0e-2cb4-43cd-b825-71f8f326ceec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo49b72b0e-2cb4-43cd-b825-71f8f326ceec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}