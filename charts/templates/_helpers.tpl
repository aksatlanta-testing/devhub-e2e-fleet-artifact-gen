
{{- define "go-echo5d9f97fe-2876-461f-b073-a5300a0c9d6c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d9f97fe-2876-461f-b073-a5300a0c9d6c.fullname" -}}
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


{{- define "go-echo5d9f97fe-2876-461f-b073-a5300a0c9d6c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d9f97fe-2876-461f-b073-a5300a0c9d6c.labels" -}}
helm.sh/chart: {{ include "go-echo5d9f97fe-2876-461f-b073-a5300a0c9d6c.chart" . }}
{{ include "go-echo5d9f97fe-2876-461f-b073-a5300a0c9d6c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5d9f97fe-2876-461f-b073-a5300a0c9d6c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5d9f97fe-2876-461f-b073-a5300a0c9d6c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}