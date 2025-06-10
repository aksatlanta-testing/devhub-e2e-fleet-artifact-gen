
{{- define "go-echoe5cf556a-afd8-44b5-bb61-9e067067f60b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5cf556a-afd8-44b5-bb61-9e067067f60b.fullname" -}}
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


{{- define "go-echoe5cf556a-afd8-44b5-bb61-9e067067f60b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5cf556a-afd8-44b5-bb61-9e067067f60b.labels" -}}
helm.sh/chart: {{ include "go-echoe5cf556a-afd8-44b5-bb61-9e067067f60b.chart" . }}
{{ include "go-echoe5cf556a-afd8-44b5-bb61-9e067067f60b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe5cf556a-afd8-44b5-bb61-9e067067f60b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe5cf556a-afd8-44b5-bb61-9e067067f60b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}