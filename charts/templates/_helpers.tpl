
{{- define "go-echod4324a35-34e1-48ff-8153-e266d9ee9362.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4324a35-34e1-48ff-8153-e266d9ee9362.fullname" -}}
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


{{- define "go-echod4324a35-34e1-48ff-8153-e266d9ee9362.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4324a35-34e1-48ff-8153-e266d9ee9362.labels" -}}
helm.sh/chart: {{ include "go-echod4324a35-34e1-48ff-8153-e266d9ee9362.chart" . }}
{{ include "go-echod4324a35-34e1-48ff-8153-e266d9ee9362.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod4324a35-34e1-48ff-8153-e266d9ee9362.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod4324a35-34e1-48ff-8153-e266d9ee9362.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}