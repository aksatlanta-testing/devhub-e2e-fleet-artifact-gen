
{{- define "go-echof7c93eb3-da4a-419f-ac66-9d7ebf7591fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof7c93eb3-da4a-419f-ac66-9d7ebf7591fd.fullname" -}}
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


{{- define "go-echof7c93eb3-da4a-419f-ac66-9d7ebf7591fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof7c93eb3-da4a-419f-ac66-9d7ebf7591fd.labels" -}}
helm.sh/chart: {{ include "go-echof7c93eb3-da4a-419f-ac66-9d7ebf7591fd.chart" . }}
{{ include "go-echof7c93eb3-da4a-419f-ac66-9d7ebf7591fd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof7c93eb3-da4a-419f-ac66-9d7ebf7591fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof7c93eb3-da4a-419f-ac66-9d7ebf7591fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}