
{{- define "go-echod416d288-305f-42d7-a11b-42717e616300.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod416d288-305f-42d7-a11b-42717e616300.fullname" -}}
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


{{- define "go-echod416d288-305f-42d7-a11b-42717e616300.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod416d288-305f-42d7-a11b-42717e616300.labels" -}}
helm.sh/chart: {{ include "go-echod416d288-305f-42d7-a11b-42717e616300.chart" . }}
{{ include "go-echod416d288-305f-42d7-a11b-42717e616300.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod416d288-305f-42d7-a11b-42717e616300.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod416d288-305f-42d7-a11b-42717e616300.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}