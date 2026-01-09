
{{- define "go-echof0d50461-10f1-4d7e-aa1a-3f5319f3a2e8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof0d50461-10f1-4d7e-aa1a-3f5319f3a2e8.fullname" -}}
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


{{- define "go-echof0d50461-10f1-4d7e-aa1a-3f5319f3a2e8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof0d50461-10f1-4d7e-aa1a-3f5319f3a2e8.labels" -}}
helm.sh/chart: {{ include "go-echof0d50461-10f1-4d7e-aa1a-3f5319f3a2e8.chart" . }}
{{ include "go-echof0d50461-10f1-4d7e-aa1a-3f5319f3a2e8.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof0d50461-10f1-4d7e-aa1a-3f5319f3a2e8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof0d50461-10f1-4d7e-aa1a-3f5319f3a2e8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}