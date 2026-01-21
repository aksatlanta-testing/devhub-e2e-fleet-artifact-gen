
{{- define "go-echo91c8c78a-e1b4-4a6a-9ac9-e3685cc8cd4c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo91c8c78a-e1b4-4a6a-9ac9-e3685cc8cd4c.fullname" -}}
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


{{- define "go-echo91c8c78a-e1b4-4a6a-9ac9-e3685cc8cd4c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo91c8c78a-e1b4-4a6a-9ac9-e3685cc8cd4c.labels" -}}
helm.sh/chart: {{ include "go-echo91c8c78a-e1b4-4a6a-9ac9-e3685cc8cd4c.chart" . }}
{{ include "go-echo91c8c78a-e1b4-4a6a-9ac9-e3685cc8cd4c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo91c8c78a-e1b4-4a6a-9ac9-e3685cc8cd4c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo91c8c78a-e1b4-4a6a-9ac9-e3685cc8cd4c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}