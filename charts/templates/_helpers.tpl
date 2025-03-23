
{{- define "go-echo7ea550fe-f5e6-4420-9d65-16f6d95f2d0f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7ea550fe-f5e6-4420-9d65-16f6d95f2d0f.fullname" -}}
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


{{- define "go-echo7ea550fe-f5e6-4420-9d65-16f6d95f2d0f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7ea550fe-f5e6-4420-9d65-16f6d95f2d0f.labels" -}}
helm.sh/chart: {{ include "go-echo7ea550fe-f5e6-4420-9d65-16f6d95f2d0f.chart" . }}
{{ include "go-echo7ea550fe-f5e6-4420-9d65-16f6d95f2d0f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7ea550fe-f5e6-4420-9d65-16f6d95f2d0f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7ea550fe-f5e6-4420-9d65-16f6d95f2d0f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}