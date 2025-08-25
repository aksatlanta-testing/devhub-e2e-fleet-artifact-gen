
{{- define "go-echoba980c85-3b9a-4b5d-86be-506a8768f320.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba980c85-3b9a-4b5d-86be-506a8768f320.fullname" -}}
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


{{- define "go-echoba980c85-3b9a-4b5d-86be-506a8768f320.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba980c85-3b9a-4b5d-86be-506a8768f320.labels" -}}
helm.sh/chart: {{ include "go-echoba980c85-3b9a-4b5d-86be-506a8768f320.chart" . }}
{{ include "go-echoba980c85-3b9a-4b5d-86be-506a8768f320.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoba980c85-3b9a-4b5d-86be-506a8768f320.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba980c85-3b9a-4b5d-86be-506a8768f320.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}