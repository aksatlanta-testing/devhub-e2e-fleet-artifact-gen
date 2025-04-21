
{{- define "go-echof3bd5c31-bb0b-4399-a898-2de68680435c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3bd5c31-bb0b-4399-a898-2de68680435c.fullname" -}}
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


{{- define "go-echof3bd5c31-bb0b-4399-a898-2de68680435c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3bd5c31-bb0b-4399-a898-2de68680435c.labels" -}}
helm.sh/chart: {{ include "go-echof3bd5c31-bb0b-4399-a898-2de68680435c.chart" . }}
{{ include "go-echof3bd5c31-bb0b-4399-a898-2de68680435c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof3bd5c31-bb0b-4399-a898-2de68680435c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof3bd5c31-bb0b-4399-a898-2de68680435c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}