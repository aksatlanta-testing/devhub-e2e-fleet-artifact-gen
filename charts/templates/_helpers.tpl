
{{- define "go-echof769fd70-20da-4de8-a12d-2ef7b022d32b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof769fd70-20da-4de8-a12d-2ef7b022d32b.fullname" -}}
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


{{- define "go-echof769fd70-20da-4de8-a12d-2ef7b022d32b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof769fd70-20da-4de8-a12d-2ef7b022d32b.labels" -}}
helm.sh/chart: {{ include "go-echof769fd70-20da-4de8-a12d-2ef7b022d32b.chart" . }}
{{ include "go-echof769fd70-20da-4de8-a12d-2ef7b022d32b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof769fd70-20da-4de8-a12d-2ef7b022d32b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof769fd70-20da-4de8-a12d-2ef7b022d32b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}