
{{- define "go-echoa4e4b57a-5c4d-4f1c-a358-964cfd00973e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4e4b57a-5c4d-4f1c-a358-964cfd00973e.fullname" -}}
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


{{- define "go-echoa4e4b57a-5c4d-4f1c-a358-964cfd00973e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4e4b57a-5c4d-4f1c-a358-964cfd00973e.labels" -}}
helm.sh/chart: {{ include "go-echoa4e4b57a-5c4d-4f1c-a358-964cfd00973e.chart" . }}
{{ include "go-echoa4e4b57a-5c4d-4f1c-a358-964cfd00973e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4e4b57a-5c4d-4f1c-a358-964cfd00973e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4e4b57a-5c4d-4f1c-a358-964cfd00973e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}