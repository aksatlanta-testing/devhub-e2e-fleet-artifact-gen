
{{- define "go-echoa981eedf-e48d-4f84-ad28-e948882b1248.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa981eedf-e48d-4f84-ad28-e948882b1248.fullname" -}}
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


{{- define "go-echoa981eedf-e48d-4f84-ad28-e948882b1248.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa981eedf-e48d-4f84-ad28-e948882b1248.labels" -}}
helm.sh/chart: {{ include "go-echoa981eedf-e48d-4f84-ad28-e948882b1248.chart" . }}
{{ include "go-echoa981eedf-e48d-4f84-ad28-e948882b1248.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa981eedf-e48d-4f84-ad28-e948882b1248.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa981eedf-e48d-4f84-ad28-e948882b1248.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}