
{{- define "go-echoc1e77bab-3127-4c36-9ede-d8804c7cd975.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1e77bab-3127-4c36-9ede-d8804c7cd975.fullname" -}}
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


{{- define "go-echoc1e77bab-3127-4c36-9ede-d8804c7cd975.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1e77bab-3127-4c36-9ede-d8804c7cd975.labels" -}}
helm.sh/chart: {{ include "go-echoc1e77bab-3127-4c36-9ede-d8804c7cd975.chart" . }}
{{ include "go-echoc1e77bab-3127-4c36-9ede-d8804c7cd975.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc1e77bab-3127-4c36-9ede-d8804c7cd975.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc1e77bab-3127-4c36-9ede-d8804c7cd975.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}