
{{- define "go-echoc4fe37ff-03fa-4fcf-a261-022c296f086f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4fe37ff-03fa-4fcf-a261-022c296f086f.fullname" -}}
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


{{- define "go-echoc4fe37ff-03fa-4fcf-a261-022c296f086f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4fe37ff-03fa-4fcf-a261-022c296f086f.labels" -}}
helm.sh/chart: {{ include "go-echoc4fe37ff-03fa-4fcf-a261-022c296f086f.chart" . }}
{{ include "go-echoc4fe37ff-03fa-4fcf-a261-022c296f086f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc4fe37ff-03fa-4fcf-a261-022c296f086f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc4fe37ff-03fa-4fcf-a261-022c296f086f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}