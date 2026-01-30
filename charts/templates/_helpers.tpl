
{{- define "go-echo62149eb2-70a5-495f-ac13-7650f4b6b5db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62149eb2-70a5-495f-ac13-7650f4b6b5db.fullname" -}}
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


{{- define "go-echo62149eb2-70a5-495f-ac13-7650f4b6b5db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62149eb2-70a5-495f-ac13-7650f4b6b5db.labels" -}}
helm.sh/chart: {{ include "go-echo62149eb2-70a5-495f-ac13-7650f4b6b5db.chart" . }}
{{ include "go-echo62149eb2-70a5-495f-ac13-7650f4b6b5db.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo62149eb2-70a5-495f-ac13-7650f4b6b5db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo62149eb2-70a5-495f-ac13-7650f4b6b5db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}